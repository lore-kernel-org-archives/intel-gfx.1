Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CFD6C88E50
	for <intel-gfx@archiver.kernel.org>; Fri, 11 Sep 2026 15:10:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE69310F67B;
	Fri, 11 Sep 2026 15:10:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="bxMba2km";
	dkim-atps=neutral
Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com
 [74.125.231.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 037D710F66D
 for <intel-gfx@lists.freedesktop.org>; Fri, 11 Sep 2026 15:10:15 +0000 (UTC)
Received: by mail-oo2-f43.google.com with SMTP id
 46e09a7af769-7f4f0cfb33cso740182a34.0
 for <intel-gfx@lists.freedesktop.org>; Fri, 11 Sep 2026 08:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789139415; x=1789744215;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=cMKSvjVBgJtd6CjrRqlh3dJgvYQUN3eoWH2kuKct2qs=;
 b=bxMba2km2Oqzt7+k9Bd/kLmrrDzqub4U5cz03NNnLyGewDWwGX04GtC1xJ/Ciqkny1
 7jITi9SCUeQXFhBUg5MdV9jlD2jfzObpJSXNO5EXSrUlV6ze1XR5Fbk8TZ3vFFiyr1NE
 nGzYTNXv8+jmFFuYTE98VQwZReNPeIMCCGUPA885GQvuxXCTnY6sMndSoejLfSfFh9r9
 TPbGlzmXNynxQZJedlY47EAkaBNHD2ZBL2/mUuVVBb5n0+zH1BDNZeKKPOuaklYhTvL9
 HI3Xw7smV1UivQ7dxM+3dYLjsKDejiWCFx52EukjBncHG0bhopVPNQBBSBuSIqV6oux0
 5UXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789139415; x=1789744215;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=cMKSvjVBgJtd6CjrRqlh3dJgvYQUN3eoWH2kuKct2qs=;
 b=Qj7XC0GtJV7CvfJh8QuFg69e3aRwe7tuAL7CILaeCsViMi25e6Qyy3BThwIkP1aNot
 jWli4y9WXFDqn9qnxiB/f0dPWLA2wA0LrH+/Mq27qLuzPS3tcPrIu/SHAq0QYW/tyvzp
 OVbTm7p2cEN7nN8ovrPfP/am5T7uBcrpC277EdziCqs+kIebvnq9SSXFtWbwwtLDiII/
 WgsXDAlTORLQZlLFssDWwxM3kHwxiaur3oFatcxCvXIdYEj2bogdxUNS19OmqwrEBVOO
 irR7o/XVLw8wVQJ5jBrrKiNi8dK5qERSkqAGqlnNHKNQjOTKr8LyBXKzLK1cGI0B/OV1
 BJUA==
X-Forwarded-Encrypted: i=1;
 AKwUvByBkMA6x3okyZaRtSDvrcZw9hUwKx9qXAowRJ6zISb7VUgsBj0Xjt9+n2qKO87FzVfryuBEo3WxHc8=@lists.freedesktop.org
X-Gm-Message-State: AFuF++k09ZE1TEOZzRp0YhwSMc5T691tyTUALtOPO+vNSXWvO6EXF3ZJ
 bLvOjCzvnAXoEvHW+Zi5BHv7cU/ZpLxtqSGw//yL/P64h7Pb2+cIDOx+P0rA9Rnqjuc=
X-Gm-Gg: AYBFou0qqyT24CRebft8LcOcBbf08KtEFEl7zd/2fECoXq6aqoMw96p9DJ14dtRSymX
 GljL25CflSLCujkbpC6+TFNmZiW5qAyfM0GJHkE3XzEgRYKXbDDkjAz2iHgddHXZGV4bPd1BP1e
 LS8aFOPwaNIsDTrILfvcEm/yhozMwrhC9wmWhb7QtwiYIpL2/6BMw8nPXEiXhUO55JLrIriBKGL
 x4QUFC4ak5cuXuGId4bMYi/U/oKS+ihhYNlsFzYbEEh+LuWyFT943HewMRAMAD+gzMlXwSOqLKn
 CSA3tuhBYIydUQN+hN3mNlCXhyJlgrPToQZK9ZKdWS93TsN7JO6qh8AtnDGwPUTOrgzGhVvabEH
 Yml/V9zz/bDRJzcSc+eM3TCHRfyINxjF4C959Xatl7n+nN/QyY+kxiMt84QQwjUnSoYoRAA8eKx
 dW3+ecezrE+GEieLlpj1vUYXyu0N/lw0v0fw9/tF8hDcWTdkEMhwjtSFmKVGmoAMTi7qZNLPI1l
 t59VkEWR2D6JegYzA4CnhqBdqA/wuYsOneyWDXlwi+nEJ/GOsgBGRGO
X-Received: by 2002:a05:6830:82c3:b0:7f6:ec23:7956 with SMTP id
 46e09a7af769-803fe1bd730mr7936240a34.2.1789139414671; 
 Fri, 11 Sep 2026 08:10:14 -0700 (PDT)
Received: from [192.168.1.102] ([96.43.243.2])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-803f6d1875csm2548656a34.22.2026.09.11.08.10.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2026 08:10:14 -0700 (PDT)
Message-ID: <258d93cd-a18d-4860-bab7-2c9c7d43a015@kernel.dk>
Date: Fri, 11 Sep 2026 09:10:12 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] block: Include error-injection.h for
 ALLOW_ERROR_INJECTION()
To: Petr Pavlu <petr.pavlu@suse.com>, Jakub Kicinski <kuba@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Simon Horman <horms@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Francois Dugast
 <francois.dugast@intel.com>, Luis Chamberlain <mcgrof@kernel.org>,
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 Aaron Tomlin <atomlin@atomlin.com>, linux-block@vger.kernel.org,
 netdev@vger.kernel.org, linux-api@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260911-module-include-error_injection-v1-0-5da895d8c84d@suse.com>
 <20260911-module-include-error_injection-v1-1-5da895d8c84d@suse.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20260911-module-include-error_injection-v1-1-5da895d8c84d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 9/11/26 9:04 AM, Petr Pavlu wrote:
> block/blk-core.c uses ALLOW_ERROR_INJECTION(), which is defined in
> asm-generic/error-injection.h. It currently relies on this header being
> included indirectly through linux/module.h -> linux/error-injection.h.
> 
> Add the missing include in preparation for removing the
> linux/error-injection.h include from linux/module.h.

Reviewed-by: Jens Axboe <axboe@kernel.dk>

if you want to shove this upstream somewhere else.

-- 
Jens Axboe

