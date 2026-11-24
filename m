Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A93E606A333
	for <intel-gfx@archiver.kernel.org>; Tue, 24 Nov 2026 15:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hyd1GVOK
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A87C610F680;
	Tue, 24 Nov 2026 15:16:18 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20A4B10F680
 for <intel-gfx@lists.freedesktop.org>; Tue, 24 Nov 2026 15:16:13 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 483DF626E9;
 Tue, 24 Nov 2026 15:16:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2E651F000C0;
 Tue, 24 Nov 2026 15:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795533371;
 bh=6071gUzTpgEKxQtfEOYjx7CYrkAC+TcVmTltejrcu5A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=Hyd1GVOK0ihovvwUXgVf2IlhtMsRG91P/SsGlF9diHAClnQlwh4N3TW69fkZC4Zsd
 7VNwf/K1LT/eJbTs+xK9hDwjhSoUpMVlP68vyftTCkSaW5dxiTFJcKBYXmmTth8OgL
 DBvVlMHQfCOVgaslMl6vU6ImYYyI69XkvnW+SkooJXcDlAM9T7WyU4TMv2t9Rt24Jd
 rUrwmqZhTfhKK3/BbhlENPNV4D4DJZA7790ou+ePA34wQqwjq85Y51/coVQKVH8NCN
 82dlVYzlXUv45kJx2lg4kXucrz4zu2AtURfWDfUrDwoN9kl08xdwmC+kzF5i/Chin7
 c50PI6BOs788A==
Date: Tue, 24 Nov 2026 16:16:07 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: intel-gfx@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>, 
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH v2 0/2] drm/i915: Annotate flexible array members with
 __counted_by() attribute
Message-ID: <awWp_l0wEjRQeC-v@zenone.zhora.eu>
References: <20261123120137.3460155-1-krzysztof.karas@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123120137.3460155-1-krzysztof.karas@intel.com>
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Krzysztof,

> Krzysztof Karas (2):
>   drm/i915: Annotate flexible array members that require minimal changes
>   drm/i915/query: Use __counted_by() to annotate flexible arrays
> 
>  drivers/gpu/drm/i915/gem/i915_gem_context.c   |   6 +-
>  .../gpu/drm/i915/gem/i915_gem_context_types.h |   2 +-
>  .../gpu/drm/i915/gem/selftests/mock_dmabuf.h  |   2 +-
>  .../drm/i915/gt/intel_execlists_submission.c  |   6 +-
>  drivers/gpu/drm/i915/i915_query.c             | 102 +++++++++---------
>  include/uapi/drm/i915_drm.h                   |   9 +-

you miss here the display patch. The suggestion was to keep it
separate.

Thanks,
Andi
