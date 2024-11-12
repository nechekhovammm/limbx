NAME = libmx.a

CC = clang
CFLAGS = -std=c11 -Wall -Wextra -Werror -Wpedantic

SRCDIR = src
INCDIR = inc
OBJDIR = obj

SRCFILES = $(wildcard $(SRCDIR)/*.c)
OBJFILES = $(patsubst $(SRCDIR)/%.c, $(OBJDIR)/%.o, $(SRCFILES))

all: $(NAME)

$(NAME): $(OBJFILES)
	ar rcs $(NAME) $(OBJFILES)
	@echo "Library $(NAME) created successfully!"

$(OBJDIR)/%.o: $(SRCDIR)/%.c | $(OBJDIR)
	$(CC) $(CFLAGS) -I $(INCDIR) -c $< -o $@

$(OBJDIR):
	mkdir -p $(OBJDIR)

uninstall:
	rm -rf $(OBJDIR) $(NAME)
	@echo "Project uninstalled successfully!"

clean:
	rm -rf $(OBJDIR)
	@echo "Object files cleaned!"

reinstall: uninstall all

.PHONY: all clean uninstall reinstall
