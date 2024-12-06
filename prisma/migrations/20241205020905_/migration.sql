/*
  Warnings:

  - You are about to drop the column `data` on the `Image` table. All the data in the column will be lost.
  - Added the required column `updatedAt` to the `Image` table without a default value. This is not possible if the table is not empty.
  - Added the required column `url` to the `Image` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Image" DROP COLUMN "data",
ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "url" VARCHAR(255) NOT NULL;
