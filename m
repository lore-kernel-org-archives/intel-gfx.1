Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9792C43217
	for <intel-gfx@archiver.kernel.org>; Fri,  4 Mar 2022 17:31:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DD1810F8E9;
	Fri,  4 Mar 2022 17:31:18 +0000 (UTC)
X-Greylist: delayed 500 seconds by postgrey-1.36 at gabe;
 Fri, 04 Mar 2022 17:31:17 UTC
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE93410F8E9
 for <intel-gfx@lists.freedesktop.org>; Fri,  4 Mar 2022 17:31:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id C33E4405D5;
 Fri,  4 Mar 2022 18:22:54 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
Authentication-Results: ste-ftg-msa2.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wDZd1ibSIDWn; Fri,  4 Mar 2022 18:22:53 +0100 (CET)
Received: by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 873B63FAC6;
 Fri,  4 Mar 2022 18:22:52 +0100 (CET)
Authentication-Results: ste-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="MnvRjPQl";
 dkim-atps=neutral
Received: from [192.168.0.209] (unknown [192.55.54.50])
 by mail1.shipmail.org (Postfix) with ESMTPSA id B02C73602D9;
 Fri,  4 Mar 2022 18:22:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1646414572; bh=gHr8KOqOwqeKr1teW7Q9RpcSa0zpk4jpfHBlF2Jhepg=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=MnvRjPQldKVl4mjKi/tWT8LZ1Y319cosG4UBNuRK0wamZwtjKNNf1bU4k0cDCY/mS
 uL8O4iBv8/7NhjWbRIXqt+IQ4MT2IIKF3C1kxijLgWqjghF0KJOAzFYQWQnhfb9GME
 AGCDN57UWUpk4w9hpPXniuEk/HqVhgA5urcZs6ys=
Message-ID: <e691741a-59cd-83aa-259d-f0df01954119@shipmail.org>
Date: Fri, 4 Mar 2022 18:22:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220304095934.925036-1-matthew.auld@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
In-Reply-To: <20220304095934.925036-1-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-gfx] [CI 1/2] drm/i915/fbdev: fixup setting screen_size
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


On 3/4/22 10:59, Matthew Auld wrote:
> Since we are actually mapping the object and not the vma, when dealing
> with LMEM, we should be careful and use the backing store size here,
> since the vma->node.size could have all kinds of funny padding
> constraints, which could result in us writing to OOB address.
>
> v2(Chris):
>    - Prefer vma->size here, which should be the backing store size. Some
>      more rework is needed here to stop using node.size in some other
>      places.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> ---
>   drivers/gpu/drm/i915/display/intel_fbdev.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
> index 2cd62a187df3..221336178991 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
> @@ -279,7 +279,7 @@ static int intelfb_create(struct drm_fb_helper *helper,
>   		/* Our framebuffer is the entirety of fbdev's system memory */
>   		info->fix.smem_start =
>   			(unsigned long)(ggtt->gmadr.start + vma->node.start);
> -		info->fix.smem_len = vma->node.size;
> +		info->fix.smem_len = vma->size;
>   	}
>   
>   	vaddr = i915_vma_pin_iomap(vma);
> @@ -290,7 +290,7 @@ static int intelfb_create(struct drm_fb_helper *helper,
>   		goto out_unpin;
>   	}
>   	info->screen_base = vaddr;
> -	info->screen_size = vma->node.size;
> +	info->screen_size = vma->size;
>   
>   	drm_fb_helper_fill_info(info, &ifbdev->helper, sizes);
>   
