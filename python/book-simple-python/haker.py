if __name__ == '__main__':

    '''
    student_marks = {}
    n = int(input())
    for _ in range(n):
        name, *line = input().split()
        print('name =', name, 'line =', line)
        scores = list(map(float, line))
        student_marks[name] = scores
    query_name = input()
    '''

    student_marks = {
        'Krishna': [67, 68, 69],
        'Arjun': [70, 98, 63],
        'Malika': [52, 56, 60],
        'Harsh': [25, 26.5, 28]
    }

    query_name = 'Harsh'
    summ = sum(student_marks[query_name]) / len(student_marks[query_name])
    print("{0:0.2f}".format(summ))
