TARGETS=bot.png logo.png cubebot.pdf

all: $(TARGETS)

%.png: %.svg
	inkscape -e $@ $<

%.pdf: %.svg
	inkscape -A $@ $<

clean:
	rm *.png *.pdf
