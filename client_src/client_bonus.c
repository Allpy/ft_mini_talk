/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client_bonus.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: alermi <alermi@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/01/31 13:29:36 by alermi            #+#    #+#             */
/*   Updated: 2025/01/31 13:40:18 by alermi           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <signal.h>
#include <unistd.h>

int	ft_atoi(char *str)
{
	int	index;

	index = 0;
	while (*str < 32 || *str == '+')
		return (-1);
	while (*str)
	{
		if (*str < '0' || *str > '9')
			return (-1);
		index = index * 10 + (*str - '0');
		str++;
	}
	return (index);
}

void	ft_send_pid(int pid)
{
	int	i;
	int	client_pid;

	client_pid = getpid();
	i = 0;
	while (i < 32)
	{
		if (client_pid >> i & 1)
			kill(pid, SIGUSR1);
		else
			kill(pid, SIGUSR2);
		i++;
		usleep(100);
	}
}

void	ft_send(int pid, unsigned char send)
{
	int				i;
	unsigned char	tmp;

	i = 0;
	while (i < 8)
	{
		if (send >> i & 1)
			kill(pid, SIGUSR1);
		else
			kill(pid, SIGUSR2);
		i++;
		usleep(100);
	}
}

void	ft_handle(int sig)
{
	if (sig == SIGUSR1)
	{
		write(1, "yazdım", 7);
	}
}

int	arg_checker(int ac, *argv)
{
	int	
	if (ac == 3)
	{
		
	}
}

int	main(int ac, char **argv)
{
	int	pid;

	if (ac == 3)
	{
		signal(SIGUSR1, ft_handle);
		pid = ft_atoi(argv[1]);
		if (pid == 0)
			return (write(1,
					"Please enter correct pid!Like: ./client 28452Hellor world",
					57), 0);
		ft_send_pid(pid);
		while (*(argv[2]))
		{
			ft_send(pid, *(argv[2]));
			*(argv[2])++;
		}
		ft_send(pid, '\0');
	}
}
