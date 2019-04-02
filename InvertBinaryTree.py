# Invert a Binary Tree

# Recursive Way
def invertBinaryTreeRecursive(tree):
    if tree is None:
        return
    swapLeftAndRight(tree)
    invertBinaryTreeRecursive(tree.left)
    invertBinaryTreeRecursive(tree.right)

def invertBinaryTreeIterative(tree):
    queue = [tree]
    while len(queue):
        current = queue.pop()
        if current is None:
            continue
            
        swapLeftAndRight(current)
        queue.append(current.left)
        queue.append(current.right)

def swapLeftAndRight(tree):
    tree.left, tree.right = tree.right, tree.left


