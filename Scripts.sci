function A1()
    img=readpbm('Encelade_surface.pbm')
    maxPx = max(img) //On cherche la valeur de nuance de gris maximale dans l'image
    [y, x] = size(img) //On récupére la taille de la matrice
    
    for i =1:x
        for j=1:y
            //Si la valeur maximale est trouvé on affiche les coordonnées du pixel correspondant
            if img(j, i)==maxPx
                then printf("Coordonnées x : %d, Coordonnées y : %d",i,j) 
            end
        end
    end 
endfunction

function A2()
    img=readpbm('Mars_surface.pbm')
    moyenne=mean(img) //On cherche la moyenne des pixels de l'image
    r =moyenne*100/255 //On calcule le pourcentage de méthane dans l'atmosphére
    disp(r)
endfunction

function B1()
    img=readpbm('Gliese 667Cc_surface.pbm')
    i=max(img) // On cherche la valeur de pixel la plus haute dans l'image
    ratio=255/i //On fait un ratio pour que les valeurs ne dépassent pas 255
    display_gray(img*ratio)
endfunction

function B2()
    img=readpbm('GD61.pbm')
    i=max(img)
    ratio=255/i
    display_gray(img*ratio)
endfunction

function B3()
    img=readpbm('HD215497.pbm')
    [y,x] = size(img)
    for i = 1:x
        for j=1:y
                if ((img(j, i)>0) & (img(j, i)<64)) then               
                    img1(j,i)=255
                    img2(j, i)=0
                    img3(j, i)=0
                    img4(j, i)=0
                elseif ((img(j, i)>64) & (img(j, i)<128)) then
                    img1(j,i)=0
                    img2(j, i)=255
                elseif ((img(j, i)>128) & (img(j, i)<192)) then
                    img2(j, i)=0
                    img3(j, i)=255
                elseif ((img(j, i)>192) & (img(j, i)<256)) then
                    img3(j, i)=0
                    img4(j, i)=255
                end
                
        end
    end
    display_gray(img1)
    scf
    display_gray(img2)
    scf
    display_gray(img3)
    scf
    display_gray(img4)

endfunction

function X2()
    img=readpbm('Gliese 581d.pbm')

    [y,x] = size(img)
    for i = 2:x-1
        for j=2:y-1
        //On fait la moyenne des différents pixels qui se trouvent autour de celui que l'on regarde
        mean = (img(j-1, i-1)+img(j+1, i+1)+img(j+1, i-1)+img(j-1, i+1)+img(j, i+1)+img(j, i-1)+img(j-1, i)+img(j+1, i))/8
        img(j, i) = mean //On applique cette moyenne au pixel actuel
        end
    end
display_gray(img)
endfunction

function X2_V2()
    img=readpbm('Gliese 581d V2.pbm')
    [y,x] = size(img)
    for i = 2:x-1
        for j=2:y-1
        mean = (img(j-1, i-1)+img(j+1, i+1)+img(j+1, i-1)+img(j-1, i+1)+img(j, i+1)+img(j, i-1)+img(j-1, i)+img(j+1, i))/8
        img(j, i) = mean
        end
    end
display_gray(img)
endfunction
