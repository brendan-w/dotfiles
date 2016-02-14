

BIN=a.out
HEADERS= 
OBJ=src/main.o


CXX=g++
CXXFLAGS=-std=c++11 -Wall -Wextra -pedantic -ggdb
LIBS=


$(BIN): $(OBJ) 
	$(CXX) -o $@ $^ $(CXXFLAGS) $(LIBS)

%.o: %.c $(HEADERS)
	$(CXX) -c -o $@ $< $(CXXFLAGS)

.PHONY: clean
clean:
	rm -f $(OBJ) $(BIN)

