i<- 1
while (i<6){
  #print(i)
  i<-i+1
  if(i==4){
    #break
    next
  }
  print(i)
}


for(x in 1:10){
  for(y in 1:5){
    print(x*y)
  }
  print("\n")
}