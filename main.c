/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: kmin <kmin@student.42.fr>                  +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/05/26 17:59:27 by kmin              #+#    #+#             */
/*   Updated: 2020/06/03 15:03:51 by kmin             ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/stat.h>

typedef struct      s_list
{
    void            *data;
    struct s_list   *next;
}                   t_list;

int compar(void *a, void *b)
{
	printf("---\n");
	printf("a = %p, b = %p\n", a, b);
	printf("*a = %d, *b = %d\n", *(int*)a, *(int*)b);
	int c =  *(int*)a - *(int*)b;
	printf("ret %d\n", c);
	return c;
}

void free_fct(void *data)
{
	printf("free: %p\n", data);
	printf("free data %d\n", *(int*)data);
	free(data);
	printf("end free\n");
	fflush(stdout);
}

int     ft_strlen(const char *str);
char    *ft_strcpy(const char *dest, const char *src);
char    *ft_strdup(const char *str);
int ft_strcmp(const char *s1, const char *s2);
__ssize_t   ft_write(int fd, const void *buf, size_t count);
__ssize_t   ft_read(int fd, void *buf, size_t count);
void        ft_list_push_front(t_list **begin_list, void *data);
int         ft_list_size(t_list *begin_list);
void        ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *));


int main(void)
{
    int r;
    char buf[100];
    char dst[100];
    int fd;
    int ret;

    memset(buf, 0, 100);
    fd = open("./test.txt", O_WRONLY | O_CREAT | O_TRUNC, S_IRUSR);
    printf("fd : %d\n",fd);
    printf("%d\n", r = ft_strlen("this is ft_strlen written in assemblier"));
    printf("%s\n", ft_strcpy(dst, "this is ft_strlen written in assemblier"));
    printf("%d\n", ft_strcmp("hello world~~\n", "hello world!!\n"));
    ft_write(fd, "hello", 5);
    ret = ft_read(STDIN_FILENO, buf, 10);
    write(1, buf, 5);
    close(fd);
    char *ptr2 = ft_strdup("hello world");
    printf("%s\n", ptr2);
    free(ptr2);

    t_list *n1 = NULL;
    char *data_ref = "hello";
    ft_list_push_front(&n1, "hello");
    ft_list_push_front(&n1, "world");
    ft_list_push_front(&n1, "hello");
    ft_list_push_front(&n1, "friend");
    ft_list_push_front(&n1, "hello");
    ft_list_push_front(&n1, "!!");
    ft_list_push_front(&n1, "hello");
    t_list *tmp = n1;
    while (tmp)
    {
        printf("%s\n",(char *)tmp->data);
        tmp = tmp->next;
    }
    printf("%d\n",ft_list_size(n1));
    ft_list_remove_if(&n1, &data_ref, compar, free_fct);
    t_list *tmp2 = n1;
    while (tmp2)
    {
        printf("%s\n",(char *)tmp2->data);
        tmp2 = tmp2->next;
    }
    while (n1)
    {
        t_list *tmp = n1;
        n1 = n1->next;
        free(tmp);
    }
   return (0);
}