TARGET := test

CXXFLAGS := --std=c++14 -g -Wall

all: $(TARGET)

$(TARGET): main.cpp inc.h
	$(CXX) $(CXXFLAGS) $< -o $<

clean:
	$(RM) $(TARGET)

.PHONY: all clean
