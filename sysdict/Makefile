TARGET := gendict
SRC := main.cc

CXXFLAGS := -std=c++14 -g -Wall

all: $(TARGET)

$(TARGET): $(SRC)
	$(CXX) $(CXXFLAGS) -o $@ $<

clean:
	$(RM) $(TARGET)

.PHONY: all clean
