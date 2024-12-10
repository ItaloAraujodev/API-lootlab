import { PrismaGenreRepository } from "@/repositories/Prisma/prismaGenreRepository";
import { PrismaPostRepository } from "@/repositories/Prisma/prismaPostRepository";
import { PrismaUserRepository } from "@/repositories/Prisma/prismaUserRepository";
import { CreatePostUseCase } from "@/useCases/Posts/createPostUseCase";

export function makeCreatePostUseCase() {
  const prismaPostRepository = new PrismaPostRepository();
  const prismaUserRepository = new PrismaUserRepository();
  const prismaGenreRepository = new PrismaGenreRepository();
  const createPostrUseCase = new CreatePostUseCase(
    prismaPostRepository,
    prismaUserRepository,
    prismaGenreRepository,
  );
  return createPostrUseCase;
}
