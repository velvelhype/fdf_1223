# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kamori <velvelhype@gmail.com>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/04 03:20:19 by kamori            #+#    #+#              #
#    Updated: 2021/12/23 23:07:51 by kamori           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = fdf
CC = gcc -I/usr/include -Imlx_linux
CFLAGS = -Werror -Wall -Wextra
SRCS = file_to_str.c \
str_to_t_fdf.c \
str_to_t_fdf_utils.c \
draw.c \
draw_line_pre_process.c \
draw_make_image.c \
main.c \

OBJS = $(SRCS:.c=.o)

all: $(NAME)

$(NAME): $(OBJS)
	make -C libft
	$(CC) $(CFLAGS) $(OBJS) \
	mlx_linux/libmlx.a \
	-Lmlx_linux -L/usr/lib -Imlx_linux -lXext -lX11 -lm -lz \
	libft/libft.a -o $(NAME)

clean:
	make clean -C libft
	rm -f $(OBJS)

fclean: clean
	make fclean -C libft
	rm -f $(NAME)

re: fclean all
