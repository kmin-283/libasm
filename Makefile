NAME = libasm.a

NA	= nasm

NA_FLAG	= -f elf64

FLAGS 	= -Wall -Werror -Wextra

SCRS =	ft_strlen.s\
		ft_strcpy.s\
		ft_strcmp.s\
		ft_write.s\
		ft_read.s\
		ft_strdup.s\
		ft_list_push_front.s\
		ft_list_size.s\
		ft_list_remove_if.s

OBJS = $(SCRS:.s=.o)

%.o	: %.s
	$(NA) $(NA_FLAG) $<

all: $(NAME)

$(NAME) : $(OBJS)
	ar rc $(NAME) $(OBJS)
	ranlib $(NAME)

clean:
	rm -rf $(OBJS)

fclean: clean
	rm -rf $(NAME)

re:	fclean all