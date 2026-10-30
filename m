Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBE3606A31D
	for <intel-gfx@archiver.kernel.org>; Fri, 30 Oct 2026 03:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xIrLRHa5
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49FE3112637;
	Fri, 30 Oct 2026 03:42:42 +0000 (UTC)
X-Greylist: delayed 2165 seconds by postgrey-1.36 at gabe;
 Fri, 30 Oct 2026 03:42:35 UTC
Received: from mta1.migadu.com (out-88.mta1.migadu.com [95.215.58.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA281112637
 for <intel-gfx@lists.freedesktop.org>; Fri, 30 Oct 2026 03:42:35 +0000 (UTC)
X-Envelope-To: intel-gfx@lists.freedesktop.org
DKIM-Signature: a=rsa-sha256; bh=fPuMcO8hnNdMFZooU0iT/ErKR35zBd41Ik7MWnF3abI=; 
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793331754; v=1; x=1793936554;
 b=xIrLRHa5GaKBnFcpijDPzhaCCOfrMjbMKQxP5pFCaenfbgO/WCo3t4cNh8202ns5maby8yDb
 JE0n5PPMvbKq2kQBbsjJNUv/74vwqcpZyoNRuJxHGYD6xGw/9OCLa6nuxHjBYM4/RkClehgXngy
 mUbbnAAepByQ8yaMiE57Sbjw=
X-Envelope-To: intel-gfx@lists.freedesktop.org
Received: by smtp.migadu.com with ESMTPS id c5737e2daac96571;
 Fri, 30 Oct 2026 03:06:26 +0000
X-Mizu-Trace-ID: c5737e2daac96571
X-Migadu-Flow: FLOW_OUT
Message-ID: <f9110c67-227b-4ab7-98f9-a51703c07352@linux.dev>
Date: Fri, 30 Oct 2026 11:06:17 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: hongfu.li@linux.dev, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tursulin@ursulin.net, airlied@gmail.com, simona@ffwll.ch, kees@kernel.org,
 tzimmermann@suse.de, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/i915/userptr: Convert page APIs to folio equivalents
 in put_pages
To: Tal Zussman <tz2294@columbia.edu>, Hongfu Li <lihongfu@kylinos.cn>
References: <20260723064651.4100-1-hongfu.li@linux.dev>
 <20261029134605.882933-1-tz2294@columbia.edu>
From: Hongfu Li <hongfu.li@linux.dev>
In-Reply-To: <20261029134605.882933-1-tz2294@columbia.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 10/29/26 9:46 PM, Tal Zussman wrote:
> On Thu, Jul 23, 2026 at 02:46:51PM +0800, Hongfu Li wrote:
>> From: Hongfu Li <lihongfu@kylinos.cn>
>>
>> Cache the folio with page_folio() at the start of the sg_table loop,
>> then use folio helpers directly to eliminate repeated compound_head()
>> lookups inside page API wrappers.
>>
>> Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
> Hi,
>
> Is there any update on picking this up? It would be great to get this
> in, as it removes the last user of trylock_page() in the tree.

Hi Tal,

You are right, this one never got picked up. I have not received any
review comments on it. It is not abandoned on my side, and if there is
anything that needs fixing, I am happy to send a v2.

> Thanks,
> Tal

-- 
Best regards,
Hongfu

