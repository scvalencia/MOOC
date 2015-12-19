comp_scientists <- c("Barbara Liskov", "John McCarthy", "Marvin Misnky", "Brian Kernighan", 
                     "Ada Lovelace", "Andrew Ng", "Niklaus Wirth", "Alan Kay", "Robert Tarjan",
                     "Guido van Rossun")

mathematicians <- c("Henri Poincare", "David Hilbert", "Kurt Goedel", "Alan Turing", 
                    "Bertrand Russell", "Walter Rudin", "Sophus Lie", "Norbert Wiener",
                    "Claude Shannon")

comp_scientists[1]
comp_scientists[4]

comp_scientists
mathematicians

scientists <- c(comp_scientists, mathematicians)
scientists

name_lengths <- nchar(scientists)
name_lengths

prime_length <- name_lengths == 13
prime_length

scientists[name_lengths == 13]

data(mtcars)
names(mtcars)
?mtcars
mtcars
str(mtcars)
dim(mtcars)
row.names(mtcars)

row.names(mtcars) <- c(1:32)

mtcars
head(mtcars, 10)
tail(mtcars, 10)

mtcars$mpg

mean(mtcars$mpg)



