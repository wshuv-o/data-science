a<-c(91,24,2,1,6,75,44,4)
b<-c("one", "two", "three")
c<-c(TRUE, FALSE, TRUE, FALSE)

print(a[3])

cat(a,b, c)

name<- "hello world"
nchar(name)

Name<-c("Hello", "World")
nchar(Name)

X<-c(20,10,45,32,12,5,454)
sort(X)
sort(X, decreasing = TRUE)

X[c(1,3)]

myMatrix<-matrix(1:20, nrow=4,ncol=5, byrow=TRUE, dimnames = list(c('i','j','a','b'), c('c','d','e','f', 'g')))
print(myMatrix)


cells<-c(1:4)
rnames<-c("r1", "r2")
cnames<-c("c1", "c2")

m<-matrix(cells, 2,2, byrow=TRUE, dimnames =list(rnames, cnames))
print(m)

print(m[2,1])
cat(m[2,2] , m[1,1])
m[c(1,2), c(2,1)]


arr<-array(1:24, c(2,3,4))
arr[1,2,1]
