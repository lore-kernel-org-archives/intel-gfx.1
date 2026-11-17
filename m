Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCEE606A329
	for <intel-gfx@archiver.kernel.org>; Tue, 17 Nov 2026 14:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O0auQB5D
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D72810F788;
	Tue, 17 Nov 2026 14:20:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E7E110F77E;
 Tue, 17 Nov 2026 14:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794925214; x=1826461214;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=OTJm7uZYjx0g7j47liDmK6W9k866qQxvxAKBe6ssu7A=;
 b=O0auQB5Dz6e8r2nG4PUTSyTyDRF+KTJljsjj6KwWNTWtYJwftFHzRBoG
 0CQXiY/E2PCCJAySfBnTmhkoh4q8G+0sIWfazg7ABhJJkU/Zq4MzdT/4Y
 mTqQ44OoiY0dAQd5wDlAS9uf6q9fFzViwARG8JApZxQ3KqcgrSkYLFBP/
 2WOPw8NMadglZuan7XJ044Yax6RhC63HpJBvvsCTPuofm/EnMpdQ0zU89
 to5sQ9/0eeyVKd5eAoljY1+1nD9q0DcDtuty/V+2I+S+CvlNDWzyaC7J1
 QrFC72aI+sSBxVvI5tSUz8+QOAtBK0/gaCOa1F3e/K4r69vkfKfGdOX5A g==;
X-CSE-ConnectionGUID: DRnf8fXySxeRr1PXZq3qIA==
X-CSE-MsgGUID: ZHv9YY6GR9iE+5tkXCMT2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3562780"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3562780"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 06:20:14 -0800
X-CSE-ConnectionGUID: gp87UjdIQiW1HA+KnTvTwQ==
X-CSE-MsgGUID: y/9BeyxLRkKBF5UIHlsMYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; d="scan'208";a="11580226"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 06:20:12 -0800
Date: Tue, 17 Nov 2026 15:19:57 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Cc: intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org, 
 Sk Anirban <sk.anirban@intel.com>
Subject: Re: [PATCH v2 i-g-t 1/2] lib/xe_gt: Add function to toggle efficient
 freq
Message-ID: <bcxh4lgvnmcloc3ovgobcf42x2pszklx3w2vlffrpnaqwjdhrd@by5cigap77ec>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>, intel-gfx@lists.freedesktop.org,
 igt-dev@lists.freedesktop.org, 
 Sk Anirban <sk.anirban@intel.com>
References: <20261113021149.3941522-3-vinay.belgaumkar@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261113021149.3941522-3-vinay.belgaumkar@intel.com>
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Vinay,
On 2026-11-12 at 18:11:50 -0800, Vinay Belgaumkar wrote:
> This writes to the use_rpe sysfs interface to toggle the use
> of GT efficient frequency. The KMD patch that introduces this
> sysfs is at: https://patchwork.freedesktop.org/series/178352/
> 
> v2: Address review comments (Anirban)
> 
> Cc: Sk Anirban <sk.anirban@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  lib/xe/xe_gt.c | 59 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/xe/xe_gt.h |  2 ++
>  2 files changed, 61 insertions(+)
> 
> diff --git a/lib/xe/xe_gt.c b/lib/xe/xe_gt.c
> index 1f0b77986..6f33df890 100644
> --- a/lib/xe/xe_gt.c
> +++ b/lib/xe/xe_gt.c
> @@ -345,6 +345,65 @@ int xe_gt_set_freq(int fd, int gt_id, const char *freq_name, uint32_t freq)
>  	return ret;
>  }
>  
> +/**
> + * xe_gt_set_use_rpe:
> + * @fd: pointer to xe drm fd
> + * @gt_id: GT id
> + * @val: Value to set use_rpe
> + *
> + * Set use_rpe. Function will assert if the sysfs node is
> + * not found.
> + *
> + * Return: success or failure
> + */
> +int xe_gt_set_use_rpe(int fd, int gt_id, uint32_t val)
> +{
> +	int ret = -EAGAIN;
> +	int gt_fd;
> +
> +	gt_fd = xe_sysfs_gt_open(fd, gt_id);
> +	igt_assert_lte(0, gt_fd);
> +
> +	while (ret == -EAGAIN)
> +		ret = igt_sysfs_printf(gt_fd, "freq0/use_rpe", "%u", val);
> +
> +	close(gt_fd);
> +
> +	return ret;
> +}
> +
> +/**
> + * xe_gt_get_use_rpe:
> + * @fd: pointer to xe drm fd
> + * @gt_id: GT id
> + *
> + * Get use_rpe. Function will assert if the sysfs node is
> + * not found.
> + *
> + * Return: use_rpe value
> + */
> +uint32_t xe_gt_get_use_rpe(int fd, int gt_id)
> +{
> +	int err = -EAGAIN;
> +	int gt_fd;
> +	uint32_t use_rpe;
> +
> +	igt_debug("Opening attr: %s\n", "freq0/rpe");
> +	gt_fd = xe_sysfs_gt_open(fd, gt_id);
> +	igt_assert_lte(0, gt_fd);
> +
> +	while (err == -EAGAIN)
> +		err = igt_sysfs_scanf(gt_fd, "freq0/use_rpe", "%u", &use_rpe);
> +
> +	igt_assert_eq(err, 1);

Can you fallback to old method on older kernels?
I mean when err == -ENOENTRY.

Regards,
Kamil


> +
> +	igt_debug("gt%d: use_rpe %u\n", gt_id, use_rpe);
> +
> +	close(gt_fd);
> +
> +	return use_rpe;
> +}
> +
>  /**
>   * xe_gt_get_freq:
>   * @fd: pointer to xe drm fd
> diff --git a/lib/xe/xe_gt.h b/lib/xe/xe_gt.h
> index 9ef15d7dd..7f824ca63 100644
> --- a/lib/xe/xe_gt.h
> +++ b/lib/xe/xe_gt.h
> @@ -29,4 +29,6 @@ int xe_gt_count_engines_by_class(int fd, int gt, int class);
>  
>  int xe_gt_set_freq(int fd, int gt_id, const char *freq_name, uint32_t freq);
>  uint32_t xe_gt_get_freq(int fd, int gt_id, const char *freq_name);
> +uint32_t xe_gt_get_use_rpe(int fd, int gt_id);
> +int xe_gt_set_use_rpe(int fd, int gt_id, uint32_t val);
>  #endif
> -- 
> 2.53.0
> 
