LIBPATH=$(CODEBOT_LANGPATH)/java/lib/
CLASSPATH=$(LIBPATH)/dist/*:.

all: Main.class

Main.class: Main.java $(LIBPATH)/dist/codebot.jar
	javac -cp $(CLASSPATH) $<

$(LIBPATH)/dist/codebot.jar:
	cd $(LIBPATH) && make

exec: Main.class
	java -cp $(CLASSPATH) Main

clean:
	rm *.class

