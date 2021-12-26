import Foundation

protocol DetailPresenterView: AnyObject {
    func apply(product: Product, quantity: Int)
}

class DefaultDetailPresenter: DetailPresenter {
    weak var view: DetailPresenterView?
    var product: Product
    var cacheManager: CacheManaging
    var quantity: Int
    init(cacheManager: CacheManaging, product: Product) {
        self.cacheManager = cacheManager
        self.product = product
        self.quantity = 0
    }

    func viewDidLoad() {
        // TODO: Get quantity value from cache
        quantity = cacheManager.value(forKey: product.name, type: Int.self) ?? 0

        view?.apply(product: product, quantity: quantity)
    }

    func didTapAddButton() {
        // TODO: Update quantity value
        //var quantity = cacheManager.value(forKey: product.name, type: Int.self) ?? 0
        quantity += 1
        cacheManager.save(value: quantity, forKey: product.name)
        view?.apply(product: product, quantity: quantity)
    }

    func didTapRemoveButton() {
        // TODO: Update quantity value
        if (quantity != 0)  {
            quantity -= 1
        }
        cacheManager.save(value: quantity, forKey: product.name)
        view?.apply(product: product, quantity: quantity)
    }
}

struct ProductQuantity: Codable {
    let quantity: Int
}
