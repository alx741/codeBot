TARGETS=codebot.png bot.png cubebot.pdf

all: $(TARGETS)

codebot.png: codebot.svg
	inkscape -e codebot.png codebot.svg

bot.png: bot.svg
	inkscape -e bot.png bot.svg

cubebot.pdf: cubebot.svg
	inkscape -A cubebot.pdf cubebot.svg

clean:
	rm $(TARGETS)
