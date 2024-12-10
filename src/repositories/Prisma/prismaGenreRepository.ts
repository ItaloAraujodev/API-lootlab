import { prisma } from "@/lib/prisma";
import type { Prisma } from "@prisma/client";
import type { IGenreRepository } from "../interfaceRepository/IGenreRepository";

export class PrismaGenreRepository implements IGenreRepository {
  async create(data: Prisma.GenreCreateInput) {
    const create = await prisma.genre.create({ data });
    return create;
  }

  async findMany() {
    const genres = await prisma.genre.findMany();
    return genres;
  }

  async findManyExists(data: string[]) {
    const genres = await prisma.genre.findMany({
      where: {
        name: {
          in: data,
        },
      },
    });
    return genres;
  }
}
