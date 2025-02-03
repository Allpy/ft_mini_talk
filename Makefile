# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: alermi <alermi@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/01/31 13:22:55 by alermi            #+#    #+#              #
#    Updated: 2025/01/31 13:26:55 by alermi           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC = cc
CFLAGS = -Wall -Wextra -Werror -g
RM = rm -rf

CLIENT = client
SERVER = server
BONUS_CLIENT = bonus_client
BONUS_SERVER = bonus_server

SRC_CLIENT = ./client_src/client.c
SRC_SERVER = ./server_src/server.c

BONUS_SRC_CLIENT = ./client_src/client_bonus.c
BONUS_SRC_SERVER = ./server_src/server_bonus.c

# colors #
GREEN   = \033[32;1m
RED     = \033[31;49;1m
YELLOW  = \033[33;49;1m
RESET   = \033[0m

all: $(SERVER) $(CLIENT)

$(SERVER): $(SRC_SERVER)
	@ $(CC) $(CFLAGS) $(SRC_SERVER) -o $(SERVER)
	@echo "\n $(GREEN) server was built ⚡$(RESET) \n"

$(CLIENT): $(SRC_SCLIENT)
	@ $(CC) $(CFLAGS) $(SRC_CLIENT) -o $(CLIENT)
	@echo "\n $(GREEN) client was build ⚡ $(RESET) \n"

clean:
	@ $(RM) $(CLIENT) $(SERVER)
	@echo "\n	$(YELLOW) server file removed ❌$(RESET)"
	@echo "\n	$(YELLOW) client file removed ❌$(RESET) \n"

fclean:
	@ $(RM) $(CLIENT) $(SERVER)
	@echo "\n $(YELLOW) server file removed ❌$(RESET)"
	@echo "\n $(YELLOW) client file removed ❌$(RESET)\n"

bonus:
	@ $(CC) $(CFLAGS) $(BONUS_SRC_SERVER) -o $(BONUS_SERVER)
	@ $(CC) $(CFLAGS) $(BONUS_SRC_CLIENT) -o $(BONUS_CLIENT)

bonus_clean:
	@ $(RM) $(BONUS_SERVER)
	@ $(RM) $(BONUS_CLIENT)

re: fclean all

.PHONY: all clean fclean re

