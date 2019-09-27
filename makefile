compile:
	g++ -c main.cpp -o main.o
	g++ -c glad.cpp -o glad.o

link:compile
	g++ *.o -o main.exe -lglfw3dll -lopengl32
	
run:link
	main
	
clean:
	rm glad.o main.o main.exe