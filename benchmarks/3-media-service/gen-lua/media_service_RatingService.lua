--
-- Autogenerated by Thrift
--
-- DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
-- @generated
--


require 'Thrift'
require 'media_service_ttypes'

RatingServiceClient = __TObject.new(__TClient, {
  __type = 'RatingServiceClient'
})

function RatingServiceClient:UploadRating(req_id, movie_id, rating, carrier)
  self:send_UploadRating(req_id, movie_id, rating, carrier)
  self:recv_UploadRating(req_id, movie_id, rating, carrier)
end

function RatingServiceClient:send_UploadRating(req_id, movie_id, rating, carrier)
  self.oprot:writeMessageBegin('UploadRating', TMessageType.CALL, self._seqid)
  local args = UploadRating_args:new{}
  args.req_id = req_id
  args.movie_id = movie_id
  args.rating = rating
  args.carrier = carrier
  args:write(self.oprot)
  self.oprot:writeMessageEnd()
  self.oprot.trans:flush()
end

function RatingServiceClient:recv_UploadRating(req_id, movie_id, rating, carrier)
  local fname, mtype, rseqid = self.iprot:readMessageBegin()
  if mtype == TMessageType.EXCEPTION then
    local x = TApplicationException:new{}
    x:read(self.iprot)
    self.iprot:readMessageEnd()
    error(x)
  end
  local result = UploadRating_result:new{}
  result:read(self.iprot)
  self.iprot:readMessageEnd()
end
RatingServiceIface = __TObject:new{
  __type = 'RatingServiceIface'
}


RatingServiceProcessor = __TObject.new(__TProcessor
, {
 __type = 'RatingServiceProcessor'
})

function RatingServiceProcessor:process(iprot, oprot, server_ctx)
  local name, mtype, seqid = iprot:readMessageBegin()
  local func_name = 'process_' .. name
  if not self[func_name] or ttype(self[func_name]) ~= 'function' then
    iprot:skip(TType.STRUCT)
    iprot:readMessageEnd()
    x = TApplicationException:new{
      errorCode = TApplicationException.UNKNOWN_METHOD
    }
    oprot:writeMessageBegin(name, TMessageType.EXCEPTION, seqid)
    x:write(oprot)
    oprot:writeMessageEnd()
    oprot.trans:flush()
  else
    self[func_name](self, seqid, iprot, oprot, server_ctx)
  end
end

function RatingServiceProcessor:process_UploadRating(seqid, iprot, oprot, server_ctx)
  local args = UploadRating_args:new{}
  local reply_type = TMessageType.REPLY
  args:read(iprot)
  iprot:readMessageEnd()
  local result = UploadRating_result:new{}
  local status, res = pcall(self.handler.UploadRating, self.handler, args.req_id, args.movie_id, args.rating, args.carrier)
  if not status then
    reply_type = TMessageType.EXCEPTION
    result = TApplicationException:new{message = res}
  elseif ttype(res) == 'ServiceException' then
    result.se = res
  else
    result.success = res
  end
  oprot:writeMessageBegin('UploadRating', reply_type, seqid)
  result:write(oprot)
  oprot:writeMessageEnd()
  oprot.trans:flush()
end

-- HELPER FUNCTIONS AND STRUCTURES

UploadRating_args = __TObject:new{
  req_id,
  movie_id,
  rating,
  carrier
}

function UploadRating_args:read(iprot)
  iprot:readStructBegin()
  while true do
    local fname, ftype, fid = iprot:readFieldBegin()
    if ftype == TType.STOP then
      break
    elseif fid == 1 then
      if ftype == TType.I64 then
        self.req_id = iprot:readI64()
      else
        iprot:skip(ftype)
      end
    elseif fid == 2 then
      if ftype == TType.STRING then
        self.movie_id = iprot:readString()
      else
        iprot:skip(ftype)
      end
    elseif fid == 3 then
      if ftype == TType.I32 then
        self.rating = iprot:readI32()
      else
        iprot:skip(ftype)
      end
    elseif fid == 4 then
      if ftype == TType.MAP then
        self.carrier = {}
        local _ktype69, _vtype70, _size68 = iprot:readMapBegin() 
        for _i=1,_size68 do
          local _key72 = iprot:readString()
          local _val73 = iprot:readString()
          self.carrier[_key72] = _val73
        end
        iprot:readMapEnd()
      else
        iprot:skip(ftype)
      end
    else
      iprot:skip(ftype)
    end
    iprot:readFieldEnd()
  end
  iprot:readStructEnd()
end

function UploadRating_args:write(oprot)
  oprot:writeStructBegin('UploadRating_args')
  if self.req_id ~= nil then
    oprot:writeFieldBegin('req_id', TType.I64, 1)
    oprot:writeI64(self.req_id)
    oprot:writeFieldEnd()
  end
  if self.movie_id ~= nil then
    oprot:writeFieldBegin('movie_id', TType.STRING, 2)
    oprot:writeString(self.movie_id)
    oprot:writeFieldEnd()
  end
  if self.rating ~= nil then
    oprot:writeFieldBegin('rating', TType.I32, 3)
    oprot:writeI32(self.rating)
    oprot:writeFieldEnd()
  end
  if self.carrier ~= nil then
    oprot:writeFieldBegin('carrier', TType.MAP, 4)
    oprot:writeMapBegin(TType.STRING, TType.STRING, ttable_size(self.carrier))
    for kiter74,viter75 in pairs(self.carrier) do
      oprot:writeString(kiter74)
      oprot:writeString(viter75)
    end
    oprot:writeMapEnd()
    oprot:writeFieldEnd()
  end
  oprot:writeFieldStop()
  oprot:writeStructEnd()
end

UploadRating_result = __TObject:new{
  se
}

function UploadRating_result:read(iprot)
  iprot:readStructBegin()
  while true do
    local fname, ftype, fid = iprot:readFieldBegin()
    if ftype == TType.STOP then
      break
    elseif fid == 1 then
      if ftype == TType.STRUCT then
        self.se = ServiceException:new{}
        self.se:read(iprot)
      else
        iprot:skip(ftype)
      end
    else
      iprot:skip(ftype)
    end
    iprot:readFieldEnd()
  end
  iprot:readStructEnd()
end

function UploadRating_result:write(oprot)
  oprot:writeStructBegin('UploadRating_result')
  if self.se ~= nil then
    oprot:writeFieldBegin('se', TType.STRUCT, 1)
    self.se:write(oprot)
    oprot:writeFieldEnd()
  end
  oprot:writeFieldStop()
  oprot:writeStructEnd()
end