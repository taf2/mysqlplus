/*
 * Provide function signatures for internal parts of mysql we depend on. 
 */
#ifndef vio_violite_h_
#define	vio_violite_h_

#ifdef	__cplusplus
extern "C" {
#endif /* __cplusplus */

enum enum_vio_type
{
  VIO_CLOSED, VIO_TYPE_TCPIP, VIO_TYPE_SOCKET, VIO_TYPE_NAMEDPIPE,
  VIO_TYPE_SSL, VIO_TYPE_SHARED_MEMORY
};

int	vio_blocking(Vio *vio, my_bool onoff, my_bool *old_mode);
my_bool	vio_is_blocking(Vio *vio);
/* setsockopt TCP_NODELAY at IPPROTO_TCP level, when possible */
int	vio_fastsend(Vio *vio);
/* Short text description of the socket for those, who are curious.. */
const char* vio_description(Vio *vio);
my_bool	vio_poll_read(Vio *vio,uint timeout);

#ifdef	__cplusplus
}
#endif /* __cplusplus */

#endif /* vio_violite_h_ */
