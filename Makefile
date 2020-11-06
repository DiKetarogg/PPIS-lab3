NAME = lab3

SRCS = lab3.cpp

INCLUDES = -Iincludes/

CC = g++ -std=c++17

CFLAGS = -Wextra -Werror -Wall

DEBUGFLAGS = -ggdb -g3

all: $(NAME)

$(NAME): $(SRCS)
	clear
	clear
	$(CC) $(CFLAGS) $(INCLUDES) $(SRCS) -o $(NAME)
cleanexe:
	rm -f $(NAME)
cleandbg:
	rm -f dbg_$(NAME)
cleandebug: cleandbg

clean: cleanexe cleandbg

debug: dbg_$(NAME)

d: debug

dbg_$(NAME): $(SRCS)
	clear
	clear
	$(CC) $(CFLAGS) $(DEBUGFLAGS) $(INCLUDES) $(SRCS) -o dbg_$(NAME)

re: cleanexe all

redebug: cleandbg debug

redbg: redebug

run: all
	./$(NAME)
rundebug: debug
	gdb ./dbg_$(NAME)
rundbg: rundebug

drun: rundebug

rerun: re run

.PHONY: all cleanexe cleandbg cleandebug cleandbg cleandebug clean d debug re redebug redbg run rundebug rundbg drun rerun
