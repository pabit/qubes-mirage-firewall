(* Copyright (C) 2015, Thomas Leonard <thomas.leonard@unikernel.com>
   See the README file for details. *)

open Utils

type port = int

type ports = {
  sport : port; (* Source port *)
  dport : port; (* Destination *)
}

type host = 
  [ `Client of client_link | `Unknown_client | `Client_gateway | `Firewall_uplink | `External ]

type info = {
  frame : Cstruct.t;
  src : host;
  dst : host;
  proto : [ `UDP of ports | `TCP of ports | `ICMP | `Unknown ];
}
