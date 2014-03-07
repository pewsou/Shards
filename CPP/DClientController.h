//
//  DClientController.h
//  rdraw0
//
//  Created by bv on 12/27/13.
//  Copyright (c) 2013 bv. All rights reserved.
//

#ifndef __rdraw0__DClientController__
#define __rdraw0__DClientController__

#include <iostream>
#define RECENT_ITEM (-1)
class UIPrimitive{
    long itsid;
public:
    UIPrimitive(){itsid=0;}
};
class DrawingLayer{
    long itsid;
public:
    DrawingLayer(){itsid=0;}
};
class DrawingClient{
    long itsid;
public:
    DrawingClient(){itsid=0;}
    long addUiPrimitiveAtLayer(UIPrimitive* p,long pid);
    DrawingLayer* getLayer(long lid);
};
class DrawingClientController{
    
public:
    //adds new Client; returns pointer to new object, 0 otherwise
    DrawingClient* newClient();
    //destroys Client object corresponding to cid
    void destroyClient(long cid);
    //returns pointer to object corresponding to cid, 0 otherwise
    DrawingClient* getClient(long cid);
    //destroys every contained object
    void kilall();
    //adds UI primitive for given client at given layer;
    void addUiPrimitiveForClientAtLayer(UIPrimitive* p,long cid=RECENT_ITEM,long lid=RECENT_ITEM);
};

#endif /* defined(__rdraw0__DClientController__) */
