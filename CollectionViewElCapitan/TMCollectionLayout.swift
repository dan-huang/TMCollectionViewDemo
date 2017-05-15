import Cocoa

class TMCollectionLayout: NSCollectionViewFlowLayout {

    // 缓存单元宽度和每行的单元个数
    var currentWidth: CGFloat = 0
    var currentCount: CGFloat = 0

    // 最小单元宽度
    let minWidth: CGFloat = 140

    // 单元之间的间隔
    let X_PADDING: CGFloat = 10.0

    override func layoutAttributesForElements(in rect: NSRect) -> [NSCollectionViewLayoutAttributes] {
        let layoutAttributesArray = super.layoutAttributesForElements(in: rect)
        for attributes in layoutAttributesArray {
            let width = rect.width

            var newCount: CGFloat
            var newWidth: CGFloat
            if width == currentWidth {
                newCount = currentCount
                newWidth = currentWidth
            } else {
                newCount = CGFloat(Int(width / (minWidth + X_PADDING)))
                newCount += 1
                while width > (newCount * minWidth + X_PADDING * (newCount - 1)) {
                    newCount += 1
                }
                newCount -= 1

                newWidth = (width - X_PADDING * (newCount - 1)) / newCount

                currentWidth = newWidth
                currentCount = newCount
            }

            if let index = (attributes.indexPath as NSIndexPath?)?.item {

                let col = index % Int(newCount)
                let row = index / Int(newCount)
                let originX = CGFloat(col) * (newWidth + X_PADDING)
                let originY = CGFloat(row) * (newWidth + X_PADDING)

                attributes.frame = NSRect(x: originX, y: originY, width: newWidth, height: newWidth)
            }
        }
        return layoutAttributesArray
    }
    
}
