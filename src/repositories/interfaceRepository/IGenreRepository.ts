import type { Genre, Prisma } from "@prisma/client";

export interface IGenreRepository {
  create(data: Prisma.GenreCreateInput): Promise<Genre>;
  findMany(): Promise<Genre[]>;
  findManyExists(data: string[]): Promise<Genre[]>;
}
