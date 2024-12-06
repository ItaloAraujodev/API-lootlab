import type { IPostRepository } from "@/repositories/interfaceRepository/IPostRepository";
import type { ICreatePost } from "../interfaces/ICreatePost";
import { uploadImageToR2 } from "@/lib/cloudflare";

export class CreatePostUseCase {
  constructor(private readonly postRepository: IPostRepository) {}

  async execute(data: ICreatePost) {
    console.log("data.images", data.images);
    // Apenas 6 numeros aleatórios
    const randow = Math.floor(Math.random() * 1000000);

    const images = data.images
      ? await Promise.all(
          data.images.map(async (imageBuffer) => {
            const uniqueKey = `post-${randow}`;
            console.log("Chave única gerada para o upload:", uniqueKey);

            try {
              const signedUrl = await uploadImageToR2(imageBuffer, uniqueKey);
              console.log("URL assinada gerada:", signedUrl);
              return { url: signedUrl };
            } catch (error) {
              console.error("Erro ao fazer upload da imagem:", error);
              throw new Error("Erro ao fazer upload da imagem");
            }
          }),
        )
      : undefined;

    const createPostInput = {
      title: data.title,
      market_link: data.market_link,
      score: data.score,
      investment: data.investment,
      token: data.token,
      network: data.network,
      comment_author: data.comment_author,
      authorId: data.authorId,
      links: data.links?.length ? { create: data.links } : undefined,
      ProjectFeatures: data.projectFeatures?.length
        ? { create: data.projectFeatures }
        : undefined,
      LaunchInfo: data.launchInfo ? { create: data.launchInfo } : undefined,
      partnerships: data.partnership?.length
        ? { create: data.partnership }
        : undefined,
      Image: images ? { create: images } : undefined,
    };

    const post = await this.postRepository.create(createPostInput);

    return post;
  }
}
