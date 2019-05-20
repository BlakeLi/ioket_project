package com.ietok.project.service.service;

import com.ietok.project.entity.Position;

import java.util.List;

public interface PositionService {
    boolean addPosition(Position position);
    boolean delPosition(Integer pos_id);
    boolean delPositionByDep(Integer dep_id);
    boolean updatePosition(Position position);

    Position getPositionByID(Position position);
    List<Position> getPositionByDep(Position position);
}
