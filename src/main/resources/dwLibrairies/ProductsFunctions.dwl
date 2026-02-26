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
    
    
// Vérifie si le produit est valide (renvoie true/false)
fun validateProduct(payload) = 
    (payload.name != null ) and
    (payload.price != null ) and
    (payload.category != null ) and
    (payload.stock != null)