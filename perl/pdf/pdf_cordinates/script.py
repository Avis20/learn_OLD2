from PIL import Image
 
im = Image.open('./pavian.png', 'r')
w, h = im.size
a = [[0]*w for i in range(h)]
b = [[0]*w for i in range(h)]
for i in range(h):
    for j in range(w):
        a[i][j] = im.getpixel((j, i))
 
 
d = [[-1,-1], [-1,0], [-1,1], [0,1], [1,1], [1,0], [1,-1], [0,-1]]
 
 
c = 40    # // порог разницы в интенсивностях двух соседей
s = 20    # // сторона квадратиков
 
 
def foo(p, q):
    cnt = 0
    for i in range(p + 1, p + s - 1):
        for j in range(q + 1, q + s - 1):
            for k in range(8):
                if abs(a[i][j] - a[i + d[k][0]][j + d[k][1]] > c):
                    cnt += 1
    return cnt
 
 
z = 0
for i in range(0, h - s, s):
    for j in range(0, w - s, s):
        p = foo(i, j)
        for k in range(s):
            for l in range(s):
                b[i + k][j + l] = p
        z = max(z, p)
 
 
for i in range(h):
    for j in range(w):
        if b[i][j] > z / 2:
            v = 255
        else:
            v = 0
        im.putpixel((j, i), v)
 
f_out = open('./pavian_out.png', 'wb')
im.save(f_out)
f_out.close()