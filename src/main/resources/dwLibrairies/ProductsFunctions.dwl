%dw 2.0

/**
* Filtre les produits par catégorie (si fournie) 
* et transforme le résultat au format JSON final.
*/
fun getListProducts(data: Array, category: String | Null = null) = 
    (if (category != null and category != "") 
        data filter (item) -> item.category == category
    else 
        data)
    map (product) -> {
        id: product.id as Number,
        name: product.name,
        category: product.category,
        price: product.price as Number,
        stock: product.stock as Number
    }
    
    
/**
* Recherche un produit par son ID et renvoie l'objet unique.
* Renvoie null si aucun produit n'est trouvé.
*/
fun getProductById(data: Array, idToFind: String | Null) = do {
    // 1. On filtre pour trouver le produit
    var product = (data filter (item) -> (item.id as String == idToFind))[0]
    ---
    // 2. On vérifie si on a trouvé quelque chose avant de transformer
    if (product != null) {
        id: product.id as Number,
        name: product.name,
        category: product.category,
        price: product.price as Number,
        stock: product.stock as Number
    } 
    else null
}