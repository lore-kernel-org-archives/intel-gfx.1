Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29721CDE013
	for <intel-gfx@archiver.kernel.org>; Fri, 26 Jun 2026 10:57:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45CBE10E353;
	Fri, 26 Jun 2026 10:57:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="nUlhdiN2";
	dkim-atps=neutral
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10E7810F569
 for <intel-gfx@lists.freedesktop.org>; Fri, 26 Jun 2026 10:57:35 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-49222b6e871so4743185e9.3
 for <intel-gfx@lists.freedesktop.org>; Fri, 26 Jun 2026 03:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1782471453; x=1783076253; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sAseHEuLitU2XuzH9XcC23JCBmfXywpYjauwlpSls6I=;
 b=nUlhdiN20IwFVbaIIzgd8chiXPiL3BhMZnNrwJR4u0ocXLHRStqffQvtvrLWSZEjwO
 QKVOebBZfMfHUjsSO8TQjYzeJoIlG45gTrmzzff6XL5txjEo8d7g86iEPeRMxA4txYgt
 ZHlmCYK5wjAOQ+7k45ka5MYh/Zg+DeNQ3fi8Syj1r1ctFrBFPXEz2/A36Blpk8KkCpSU
 oR6hjC7lPIvV8NE6gfjn/KhZIFoyB+LjoXTSNj8uB58ecofr3aEQuj5XMNyZDY7Psqyx
 PCZKGc893aIEhPz8ht0sAAG36j6Mmq9r0iN1qgt3hJzVTUHRXkJSjGqxbB7HM41RCaRV
 25cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782471453; x=1783076253;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sAseHEuLitU2XuzH9XcC23JCBmfXywpYjauwlpSls6I=;
 b=CkwgaV+9w7ArmYnGrUTeuCJBud+km4IeSPBHoTHuIGvRPEws0BmIN04KEJ2e/n1jTn
 szy9P6kDA6b8+/1xKBC5Hhaq1PhUUMFFIsyIlZdv0ntaCy8h9B2E45vhUwsOJKBqKGvP
 U/xu4xpbk0UtMwgjQR/0iUAARTgQAkn0MSpLuh72KL8MhmSf3mt9MaSjM8Ga9dJ0T4BY
 vQr+psQZrORP2JKbf2T1bjt+0FFVzSY6QfqOrtWl9OeDPJGTtz4Sc8v5NJVk5ItwVJzo
 +4DUi4l74XBxnsl9siRvpaDhv5lGtg7PdnhXo3l1U22C1SaHxEttPQhVvrLjVI6vsut2
 Y52g==
X-Forwarded-Encrypted: i=1;
 AFNElJ+UC0c7iDV1kVmXrNDnowlIeg7AinEPwnYp1PJSLImtMz6F5b9prbthrgNZ9fEZ6IlSKGQ2Knd8cWo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwT/NJKve2fKDIdZot0+HaWFI9DtDlUyToGvnwP5R8K2KJivoDy
 EZtDNu47AjnOM0JJxM4CWEYdxrhLUvI5W7SIJgz/Sq4DQpZCCISKpAhXH/ldluy+Ytk=
X-Gm-Gg: AfdE7ckA588dMIMbdNvacdQXHutBhmNVwpOR8Xfz1IIG2DWb7WiyisIuRAJ/3cbY4Sf
 8vrIttsJ2CEz4NilZ578nt0LQwGQ3rfONL7iDihNz1pZts8tbE3G4Alh/B2S65fW8VQR+sDZup1
 yUePYhO3oOcI/YMfcumGsfukkcEJiQQJl/GImM57ERPrddgvDHLI7INx2KPHt4ZEPzzlE2OnOee
 Q4gxtlLMmFZ0nxeWh+TfxCB86jBX7yCS4nerYrAJWRnZz0RkVT6fnNJzYe/S3OpVe7N9swUTYd0
 M4gXQTEmmQzI8BKAnUF7/a2c6iY8ITciknbcbW9kY/HLMDTfChjFYZK6GSL/AXIG4cwmQGD86mz
 SAVNphnk/y9Kinm8OaXKhWwdXmY72/3ueNfJDgIbIlwo5AqOqwI48allGQTx7gEFW+3WM7D0Fra
 2Ddf2NKu/LRBOQn2OsmC11+XTob6Yqg2dbxA==
X-Received: by 2002:a05:600c:8a1a:10b0:492:488c:f627 with SMTP id
 5b1f17b1804b1-49266872ce4mr69640085e9.11.1782471452665; 
 Fri, 26 Jun 2026 03:57:32 -0700 (PDT)
Received: from [192.168.0.116] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49268f700c0sm75417365e9.0.2026.06.26.03.57.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jun 2026 03:57:32 -0700 (PDT)
Message-ID: <5021eae6-40f8-4079-9b5d-f511537aa460@ursulin.net>
Date: Fri, 26 Jun 2026 11:57:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/ttm: add generic drvparam[] alias for
 ttm_place::fpfn/lpfn
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: alexander.deucher@amd.com,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20260626063658.10237-1-Arunpravin.PaneerSelvam@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20260626063658.10237-1-Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 26/06/2026 07:36, Arunpravin Paneer Selvam wrote:
> The fpfn/lpfn fields in struct ttm_place are named after page frame
> numbers, but they are really just placement parameters interpreted by
> the backend resource manager. Wrap them in a union with a generic
> drvparam[2] array so backends can access the same storage without the
> PFN-specific naming.
> 
> drvparam[0]/drvparam[1] alias fpfn/lpfn, so existing users and the
> VRAM range manager are unchanged. This decouples the API from
> PFN/range-specific semantics so that these fields can be used more
> flexibly in the future (e.g. mask-based or segment-aware placement
> constraints). No functional change.
> 
> v2: Use a union exposing a generic drvparam[2] array instead of
>      renaming fpfn/lpfn to param1/param2, keeping existing users
>      unchanged (Tvrtko Ursulin)
> 
> Suggested-by: Christian König <christian.koenig@amd.com>
> Assisted-by: Claude:claude-opus-4-8
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> ---
>   include/drm/ttm/ttm_placement.h | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/include/drm/ttm/ttm_placement.h b/include/drm/ttm/ttm_placement.h
> index ab2639e42c54..7db2073f3236 100644
> --- a/include/drm/ttm/ttm_placement.h
> +++ b/include/drm/ttm/ttm_placement.h
> @@ -75,14 +75,22 @@
>    *
>    * @fpfn:	first valid page frame number to put the object
>    * @lpfn:	last valid page frame number to put the object
> + * @drvparam:	generic driver/backend placement parameters; the
> + *		interpretation is defined by the backend resource manager.
> + *		drvparam[0] and drvparam[1] alias @fpfn and @lpfn.
>    * @mem_type:	One of TTM_PL_* where the resource should be allocated from.
>    * @flags:	memory domain and caching flags for the object
>    *
>    * Structure indicating a possible place to put an object.
>    */
>   struct ttm_place {
> -	uint64_t	fpfn;
> -	uint64_t	lpfn;
> +	union {
> +		struct {
> +			uint64_t	fpfn;
> +			uint64_t	lpfn;
> +		};
> +		uint64_t	drvparam[2];
> +	};
>   	uint32_t	mem_type;
>   	uint32_t	flags;
>   };
> 
> base-commit: cdeb2ccd993ed8647adbbda2c3b103aa717fd6f7

LGTM but then again I suggested it (hint hint) so I may be biased :)

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

