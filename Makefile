APP = choose
SRC = Utils.swift choose_new.swift

choose: $(SRC)
	swiftc $(SRC) -o $@

install: choose
	cp -f ./choose ~/.local/ubin/

run: choose
	ls | ./choose
