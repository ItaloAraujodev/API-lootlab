-- AlterTable
ALTER TABLE "Post" ADD COLUMN     "genreId" TEXT[];

-- CreateTable
CREATE TABLE "Genre" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "postId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Genre_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Genre_name_key" ON "Genre"("name");

-- AddForeignKey
ALTER TABLE "Genre" ADD CONSTRAINT "Genre_postId_fkey" FOREIGN KEY ("postId") REFERENCES "Post"("id") ON DELETE SET NULL ON UPDATE CASCADE;
