import Cocoa

class TMCollectionLayout: NSCollectionViewFlowLayout {

    // 缓存单元宽度和每行的单元个数
    var currentWidth: CGFloat = 0
    var currentCount = 0

    // 最小单元宽度
    let minWidth: CGFloat = 140
    // 每行最小单元个数
    let minRowCount = 3

    // 单元之间的间隔
    let X_PADDING: CGFloat = 10.0

    override func layoutAttributesForElements(in rect: NSRect) -> [NSCollectionViewLayoutAttributes] {
        let layoutAttributesArray = super.layoutAttributesForElements(in: rect)
        for attributes in layoutAttributesArray {
            let width = rect.width

            var newCount: Int
            var newWidth: CGFloat
            if width == currentWidth {
                newCount = currentCount
                newWidth = currentWidth
            } else {
                newCount = Int(width / (minWidth + X_PADDING)) + 1
                while width > (CGFloat(newCount) * minWidth + X_PADDING * CGFloat(newCount - 1)) {
                    newCount += 1
                }
                newCount -= 1
                newCount = max(newCount, minRowCount)

                newWidth = (width - X_PADDING * CGFloat(newCount - 1)) / CGFloat(newCount)
                newWidth = max(minWidth, newWidth)

                currentWidth = newWidth
                currentCount = newCount
            }

            if let itemIndex = (attributes.indexPath as NSIndexPath?)?.item {

                let col = itemIndex % Int(newCount)
                let row = itemIndex / Int(newCount)
                let originX = CGFloat(col) * (newWidth + X_PADDING)
                let originY = CGFloat(row) * (newWidth + X_PADDING)

                attributes.frame = NSRect(x: originX, y: originY, width: newWidth, height: newWidth)
            }
        }
        return layoutAttributesArray
    }
    
}
