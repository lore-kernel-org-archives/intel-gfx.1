Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D387A606A31A
	for <intel-gfx@archiver.kernel.org>; Wed, 21 Oct 2026 22:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BkcUtMSe
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BD0310E23C;
	Wed, 21 Oct 2026 22:13:45 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4906B10E23C
 for <intel-gfx@lists.freedesktop.org>; Wed, 21 Oct 2026 22:13:39 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id E24944357B;
 Wed, 21 Oct 2026 22:13:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 368181F000C7;
 Wed, 21 Oct 2026 22:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792620818;
 bh=7v6rCThqFH+aWoI45fdNhzuEhmC6+E1tUVRGLu8Z00A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=BkcUtMSeLJBkNah3jPI3hOSH88hn0qwfTmltR0hlHtjaK/GTWT733sc/IEMvTJxNg
 Dr7GZjeJaw6ks1rst0QBH3uXyKA4rIwVQSEZgGBEIO2ohLT2k+xt/OZRQGOe0iH62H
 pdJ1lRM+IicXB6bXX3BDXUFRvxZrxj/PX093vUEytjouSj46RYBtk1MB2lxZtf+VrT
 JiOVYcDmPpUk93sGjX2j9e4BXRfwD+gmHBjpChliBb6wMdo+4SouL79am4nX6QW0Fl
 lzIrJvX2DsmBRumHZFaIcou7nzNCYc+kwbKjj0zkrjtnT23ii0z30VJ4dR+SQKrwpc
 CGqHXCLqTTkPQ==
Date: Thu, 22 Oct 2026 00:13:36 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: intel-gfx@lists.freedesktop.org, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, 
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>, 
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH v2] drm/i915/gt: Do not destroy uninitialized timer
Message-ID: <atk40Brj3Cpd1ViN@zenone.zhora.eu>
References: <20261001071757.2688815-1-krzysztof.karas@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001071757.2688815-1-krzysztof.karas@intel.com>
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
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Krzysztof,

On Thu, Oct 01, 2026 at 07:17:57AM +0000, Krzysztof Karas wrote:
> If intel_ring_begin() fails in live_emit_pte_full_ring(), then
> cleanup is performed on an uninitialized timer.
> 
> Prevent that by jumping to a dedicated label for driver removal
> cleanup.
> 
> Assisted-by: Copilot-Claude-Opus-5
> Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
> Signed-off-by: Krzysztof Karas <krzysztof.karas@intel.com>

Reviewed and pushed to drm-intel-gt-next.

Thanks,
Andi
