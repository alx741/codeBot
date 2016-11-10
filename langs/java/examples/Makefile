LIBPATH=../lib
CLASSPATH=$(LIBPATH)/dist/codebot.jar:.

Main.class: Main.java codebot.jar
	javac -cp $(CLASSPATH) $<

codebot.jar:
	cd $(LIBPATH) && make

exec: Main.class
	java -cp $(CLASSPATH) Main

clean:
	rm *.class
