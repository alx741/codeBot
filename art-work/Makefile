TARGETS=bot.png ../logo.png logo.png cubebot.pdf

all: $(TARGETS)

%.png: %.svg
	inkscape -e $@ $<

%.pdf: %.svg
	inkscape -A $@ $<

../logo.png: logo.png
	cp logo.png ../

clean:
	rm *.png *.pdf
