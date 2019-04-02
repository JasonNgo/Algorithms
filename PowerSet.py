# Power Sets: Calculate all unique subsets of a given array

def powerSet(array):
    subsets = [[]]
    for element in array:
        for i in range(len(subsets)):
            currentSubset = subsets[i]
            subsets.append(currentSubset + [element])
    return subsets
