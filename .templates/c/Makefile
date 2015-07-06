


# files and paths

EXE_NAME = a.out

HEADERS = 
OBJ     = src/main.o



# compile settings

CC=gcc
CFLAGS=-Wall -Wextra -pedantic -ggdb
LIBS=



# targets

$(EXE_NAME): $(OBJ) 
	$(CC) -o $@ $^ $(CFLAGS) $(LIBS)

%.o: %.c $(HEADERS)
	$(CC) -c -o $@ $< $(CFLAGS)

.PHONY: clean
clean:
	rm -f $(OBJ) $(EXE_NAME)

