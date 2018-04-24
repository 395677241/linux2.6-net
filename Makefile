#
# Makefile for the linux networking.
#
# 2 Sep 2000, Christoph Hellwig <hch@infradead.org>
# Rewritten to use lists instead of if-statements.
#

obj-y	:= nonet.o

obj-$(CONFIG_NET)		:= socket.o core/

tmp-$(CONFIG_COMPAT) 		:= compat.o
obj-$(CONFIG_NET)		+= $(tmp-y)

# LLC has to be linked before the files in net/802/
obj-$(CONFIG_LLC)		+= llc/
obj-$(CONFIG_NET)		+= ethernet/ 802/ sched/ netlink/
obj-$(CONFIG_INET)		+= ipv4/
obj-$(CONFIG_XFRM)		+= xfrm/
obj-$(CONFIG_UNIX)		+= unix/
ifneq ($(CONFIG_IPV6),)
obj-y				+= ipv6/
endif
obj-$(CONFIG_PACKET)		+= packet/
obj-$(CONFIG_NET_KEY)		+= key/
obj-$(CONFIG_NET_SCHED)		+= sched/
obj-$(CONFIG_BRIDGE)		+= bridge/
obj-$(CONFIG_IPX)		+= ipx/
obj-$(CONFIG_ATALK)		+= appletalk/
obj-$(CONFIG_WAN_ROUTER)	+= wanrouter/
obj-$(CONFIG_X25)		+= x25/
obj-$(CONFIG_LAPB)		+= lapb/
obj-$(CONFIG_NETROM)		+= netrom/
obj-$(CONFIG_ROSE)		+= rose/
obj-$(CONFIG_AX25)		+= ax25/
obj-$(CONFIG_IRDA)		+= irda/
obj-$(CONFIG_BT)		+= bluetooth/
obj-$(CONFIG_SUNRPC)		+= sunrpc/
obj-$(CONFIG_RXRPC)		+= rxrpc/
obj-$(CONFIG_ATM)		+= atm/
obj-$(CONFIG_DECNET)		+= decnet/
obj-$(CONFIG_ECONET)		+= econet/
obj-$(CONFIG_VLAN_8021Q)	+= 8021q/
obj-$(CONFIG_IP_SCTP)		+= sctp/

ifeq ($(CONFIG_NET),y)
obj-$(CONFIG_SYSCTL)		+= sysctl_net.o
endif
