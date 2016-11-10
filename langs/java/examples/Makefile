LIBPATH=../lib
CLASSPATH=$(LIBPATH)/dist/codebot.jar:.

exec: Main.class
	java -cp $(CLASSPATH) Main

Main.class: Main.java codebot.jar
	javac -cp $(CLASSPATH) $<

codebot.jar:
	cd $(LIBPATH) && make

clean:
	rm *.class
