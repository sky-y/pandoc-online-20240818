TARGET := sky-y_pandoc-online_20240818.pdf
SRCS := sky-y_pandoc-online_20240818.md
DEFAULTS := defaults.yaml
HEADER := header.tex

.PHONY: all clean

all: $(TARGET)

$(TARGET): $(SRCS)
	pandoc $^ -o $@ -d $(DEFAULTS) -H $(HEADER)

clean:
	rm -rf $(TARGET)