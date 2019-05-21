package com.ietok.project.dao;

import com.ietok.project.entity.Position;

import java.util.List;

public interface PositionDao {
    boolean addPosition(Position position);
    boolean delPositionByDep(Position position);
    boolean delPosition(Position position);
    boolean updatePosition(Position position);

    Position getPositionByNameAndDep(Position position);
    Position getPositionByID(Position position);
    List<Position> getPositionByDep(Position position);
    List<Position> getAllPosition();
}
