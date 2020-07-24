CC = g++
EXE = UpperCut.exe
CFLAGS= -std=c++11 -Wall -L.\deps\lib -I.\deps\include
LINKER_FLAGS = -lglew32 -lglfw3 -lopengl32 -lgdi32 -luser32 -lkernel32 -lglu32 -static-libstdc++ -static
OBJS = main.o menu.o player.o

SRC_DIR = ./src
SRC_FILES := $(wildcard $(SRC_DIR)/*.cpp)

.DEFAULT_GOAL := all

all: $(EXE)

$(EXE): $(OBJS)
	$(CC) $(CFLAGS) $^ -o $(EXE) $(LINKER_FLAGS)

%.o: $(SRC_DIR)/%.cpp $(SRC_DIR)/%.h
	$(CC) $(CFLAGS) -c $< $(LINKER_FLAGS)

main.o: $(SRC_DIR)/main.cpp
	$(CC) $(CFLAGS) -c $< $(LINKER_FLAGS)

.PHONY : clean
clean:
	del /Q /S *.o $(EXE)