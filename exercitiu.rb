#functia din problema
def functia(t)
  y=t**3-3*(t**2)+6*t-5
  return y
end
#derivata functiei
def derivata(t)
  y=3*(t**2)-6*t+6
  return y
end
#derivata a 2-a a functiei
def derivata2(t)
  y=6*t-6
  return y
end

#Metoda injumatatirii
def injumatatire(a,b,eps)
  if ((functia(a)*functia(b))>0)
    programa()
  else
    i=0
    while (b-a>eps)
      x=(a+b)/2
      i+=1
      if ((functia(a)*functia(x))<=0)
        b=x
      else
        a=x
      end
    end
  end
  f=functia(x);
  return x, f, i
end
#Metoda tangentei
def tangenta(a,b,eps)
  i=0
  if((functia(a)*derivata2(a))>0)
    x1=a
  else
    x1=b
  end
  begin
    x=x1
    x1=x-functia(x)/derivata(x)
    i+=1
  end while ((x1-x).abs>eps)
  f=functia(x1)
  return x1,f,i
end

#Metoda secantei
def secanta (a,b,eps)
  i=0
  if((functia(a)*derivata2(a))>0)
    x1=a
    x2=a+eps
  else
    x1=b
    x2=b-eps
  end
  begin
    x,x1=x1,x2
    x2=x1-functia(x1)*(x1-x)/(functia(x1)-functia(x))
    i+=1
  end while ((x2-x1).abs>eps)
  f=functia(x2)
  return x2,f,i
end

#Introducerea segmentului in care se afla radacina
def programa ()
  puts ("Introduceti numarul a:")
  a=gets.chomp.to_f
  puts("Introduceti numarul b:")
  b=gets.chomp.to_f
  puts("Introduceti eroarea")
  eps=gets.chomp.to_f

  if ((functia(a)*functia(b))>0) #daca produsul este mai mare ca 0 datele nu sunt introduse corect si trebuie introduse din nou
    programa()
  else
    #apelarea functiilor ce calculeaza radacina
    inj_x, inj_f, inj_i =injumatatire(a,b,eps)
    tan_x, tan_f, tan_i =tangenta(a,b,eps)
    sec_x, sec_f, sec_i= secanta(a,b,eps)
#afisarea rezultatului
    puts("Metoda injumatatirii: radacina functiei este #{inj_x}","valoarea functiei este #{inj_f}","a fost executat in #{inj_i} pasi")
    puts("Metoda tangentei: radacina functiei este #{tan_x}","valoarea functiei este #{tan_f}","a fost executat in #{tan_i} pasi")
    puts("Metoda tangentei: radacina functiei este #{sec_x}","valoarea functiei este #{sec_f}","a fost executat in #{sec_i} pasi")
#introducerea unui nou segment sau finisarea programei
    puts("doriti sa mai introduceti un segment? y/n")
    rasp=gets.chomp
    while(rasp !="y"&& rasp !="n")
      puts " introduceti sau y sau n"
      rasp=gets.chomp
    end
    if rasp=="y"
      programa()
    else rasp=="n"
      puts "La revedere"
    end
  end
end

programa()
